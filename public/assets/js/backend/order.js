define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            let shop_commission = $("#shop_commission").data("commission")
            // 初始化表格参数配置
            Table.api.init({
                // showFooter:true,
                extend: {
                    index_url: 'order/index' + location.search,
                    add_url: 'order/add',
                    edit_url: 'order/edit',
                    multi_url: 'order/multi',
                    table: 'order',
                }
            });

            var table = $("#table");

            // 初始化表格
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'id',
                sortName: 'id',
                columns: [
                    [
                        {checkbox: true},
                        {field: 'id', title: __('Id')},
                        // {field: 'ordershop.name', title: __('Shop_id'),operate:'LIKE'},
                        {field: 'numbers', title: __('Numbers'),operate:'LIKE'},
                        {field: 'transaction', title: __('Transaction'),operate:'LIKE'},
                        {field: 'total_counts', title: __('total_counts')},
                        {field: 'total_price', title: __('total_price'),},
                        {field: 'orderaddress.contact', title: __('Orderaddress.contact')},
                        {field: 'orderaddress.phone', title: __('Orderaddress.phone'),operate:'LIKE'},
                        {field: 'orderaddress.address',title: __('Orderaddress.address'),},
                        {field: 'createtime', title: __('Createtime'), operate: 'RANGE', addclass: 'datetimerange', formatter: Table.api.formatter.datetime},
                        {field: 'updatetime', title: __('Updatetime'), operate: 'RANGE', addclass: 'datetimerange', formatter: Table.api.formatter.datetime},
                        {field: 'status', title: __('Status'), searchList: {"-1": __('Status -1'), "0": __('Status 0'), "1": __('Status 1'), "2": __('Status 2'), "3": __('Status 3'), "4": __('Status 4'), "5": __('Status 5'), "6": __('Status 6'), "7": __('Status 7'), "8": __('Status 8'), "9": __('Status 9'), "10": __('Status 10'),}, formatter: Table.api.formatter.status},
                        {field: 'operate', title: __('Operate'), table: table, events: Table.api.events.operate, formatter: Table.api.formatter.operate},
                    ]
                ]
            });

            // 为表格绑定事件
            Table.api.bindevent(table);
        },
        recyclebin: function () {
            // 初始化表格参数配置
            Table.api.init({extend: {'dragsort_url': ''}});

            var table = $("#table");

            // 初始化表格
            table.bootstrapTable({
                url: 'order/recyclebin' + location.search,
                pk: 'id',
                sortName: 'id',
                columns: [
                    [
                        {checkbox: true},
                        {field: 'id', title: __('Id')},
                        {field: 'deletetime', title: __('Deletetime'), operate: 'RANGE', addclass: 'datetimerange', formatter: Table.api.formatter.datetime},
                        {field: 'operate', width: '130px', title: __('Operate'), table: table, events: Table.api.events.operate, buttons: [{name: 'Restore', text: __('Restore'), classname: 'btn btn-xs btn-info btn-ajax btn-restoreit', icon: 'fa fa-rotate-left', url: 'order/restore', refresh: true}, {name: 'Destroy', text: __('Destroy'), classname: 'btn btn-xs btn-danger btn-ajax btn-destroyit', icon: 'fa fa-times', url: 'order/destroy', refresh: true}], formatter: Table.api.formatter.operate}
                    ]
                ]
            });

            // 为表格绑定事件
            Table.api.bindevent(table);
        },
        add: function () {
            Controller.api.bindevent();
        },
        edit: function () {
            let table = $("#table");
            // 初始化表格
            table.bootstrapTable();
            let agree = $("#c-platform_agree_msg_");
            let refuse = $("#c-platform_refuse_msg_");
            agree.hide()
            refuse.hide()
            let agree_ ="<label class=\"control-label col-xs-12 col-sm-2\">平台退单原因:</label>\n" +
                "        <div class=\"col-xs-12 col-sm-8\">\n" +
                "            <input id=\"c-platform_agree_msg\" data-rule=\"required\" class=\"form-control\" name=\"row[platform_agree_msg]\" type=\"text\" value=\"\">\n" +
                "        </div>\n"
            let refuse_ = "<label class=\"control-label col-xs-12 col-sm-2\">平台拒绝原因:</label>\n" +
                "        <div class=\"col-xs-12 col-sm-8\">\n" +
                "            <input id=\"c-platform_refuse_msg\" data-rule=\"required\" class=\"form-control\" name=\"row[platform_refuse_msg]\" type=\"text\" value=\"\">\n" +
                "        </div>\n"
            $("input[name='row[status]']").click(function(){
                let select = $(this).val();
                if(select==='10'){
                    refuse.show()
                    refuse.html(refuse_)
                    agree.hide()
                    agree.html('')
                }
                if(select==='9'){
                    refuse.hide()
                    refuse.html('')
                    agree.show()
                    agree.html(agree_)
                }
            });
            Controller.api.bindevent(table);
        },
        api: {
            bindevent: function () {Form.api.bindevent($("form[role=form]"));}
        }
    };
    return Controller;
});