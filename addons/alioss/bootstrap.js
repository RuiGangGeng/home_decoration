//如果开启了alioss客户端上传模式
if (typeof Config.upload.storage !== 'undefined' && Config.upload.storage === 'alioss') {
    require(['upload', '../addons/alioss/js/spark'], function (Upload, SparkMD5) {
        var _onFileAdded = Upload.events.onFileAdded;
        var _onUploadResponse = Upload.events.onUploadResponse;
        var getFileMd5 = function (file, cb) {
            var blobSlice = File.prototype.slice || File.prototype.mozSlice || File.prototype.webkitSlice,
                file = file.getNative(),
                chunkSize = 2097152,                             // Read in chunks of 2MB
                chunks = Math.ceil(file.size / chunkSize),
                currentChunk = 0,
                spark = new SparkMD5.ArrayBuffer(),
                fileReader = new FileReader();

            fileReader.onload = function (e) {
                spark.append(e.target.result);                   // Append array buffer
                currentChunk++;
                if (currentChunk < chunks) {
                    loadNext();
                } else {
                    cb && cb(spark.end());  // Compute hash
                }
            };

            fileReader.onerror = function () {
                console.warn('oops, something went wrong.');
            };

            function loadNext() {
                var start = currentChunk * chunkSize,
                    end = ((start + chunkSize) >= file.size) ? file.size : start + chunkSize;

                fileReader.readAsArrayBuffer(blobSlice.call(file, start, end));
            }

            loadNext();
        };
        var _process = function (up, file) {
            (function (up, file) {
                getFileMd5(file, function (md5) {
                    Fast.api.ajax({
                        url: "/addons/alioss/index/params",
                        data: {method: 'POST', md5: md5, name: file.name, type: file.type, size: file.size},
                    }, function (data) {
                        file.md5 = md5;
                        file.status = 1;
                        file.key = data.key;
                        file.OSSAccessKeyId = data.id;
                        file.policy = data.policy;
                        file.signature = data.signature;
                        up.start();
                        return false;
                    });
                });
            })(up, file);
        };
        Upload.events.onFileAdded = function (up, files) {
            return _onFileAdded.call(this, up, files);
        };
        Upload.events.onBeforeUpload = function (up, file) {
            if (typeof file.md5 === 'undefined') {
                up.stop();
                _process(up, file);
            } else {
                up.settings.headers = up.settings.headers || {};
                up.settings.multipart_params.key = file.key;
                up.settings.multipart_params.OSSAccessKeyId = file.OSSAccessKeyId;
                up.settings.multipart_params.success_action_status = 200;
                if (typeof file.callback !== 'undefined') {
                    up.settings.multipart_params.callback = file.callback;
                }
                up.settings.multipart_params.policy = file.policy;
                up.settings.multipart_params.signature = file.signature;
                //up.settings.send_file_name = false;
            }
        };
        Upload.events.onUploadResponse = function (response, info, up, file) {
            try {
                var ret = {};
                if (info.status === 200) {
                    var url = '/' + file.key;
                    Fast.api.ajax({
                        url: "/addons/alioss/index/notify",
                        data: {method: 'POST', name: file.name, url: url, md5: file.md5, size: file.size, type: file.type, policy: file.policy, signature: file.signature}
                    }, function () {
                        return false;
                    });
                    ret.code = 1;
                    ret.data = {
                        url: url
                    };
                } else {
                    ret.code = 0;
                    ret.msg = info.response;
                }
                return _onUploadResponse.call(this, JSON.stringify(ret));

            } catch (e) {
            }
            return _onUploadResponse.call(this, response);

        };
    });
}