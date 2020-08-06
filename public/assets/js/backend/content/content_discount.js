define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'content/content_discount/index' + location.search,
                    add_url: 'content/content_discount/add',
                    edit_url: 'content/content_discount/edit',
                    del_url: 'content/content_discount/del',
                    multi_url: 'content/content_discount/multi',
                    table: 'content_discount',
                }
            });

            var table = $("#table");

            // 初始化表格
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'id',
                sortName: 'weigh',
                columns: [
                    [
                        {checkbox: true},
                        {field: 'id', title: __('Id')},
                        {field: 'type_list', title: __('Type_list'), searchList: {"1":__('Type_list 1'),"2":__('Type_list 2'),"3":__('Type_list 3'),"4":__('Type_list 4')}, formatter: Table.api.formatter.normal},
                        {field: 'shop.name', title: __('Shop_id')},
                        {field: 'good.name', title: __('Good.name')},
                        {field: 'image', title: __('Image'), events: Table.api.events.image, formatter: Table.api.formatter.image},
                        {field: 'weigh', title: __('Weigh')},
                        {field: 'createtime', title: __('Createtime'), operate:'RANGE', addclass:'datetimerange', formatter: Table.api.formatter.datetime},
                        {field: 'updatetime', title: __('Updatetime'), operate:'RANGE', addclass:'datetimerange', formatter: Table.api.formatter.datetime},
                        {field: 'operate', title: __('Operate'), table: table, events: Table.api.events.operate, formatter: Table.api.formatter.operate}
                    ]
                ]
            });

            // 为表格绑定事件
            Table.api.bindevent(table);
        },
        add: function () {
            $("#c-good_id").data("params", function () {
                return {custom: {shop_id:$("#c-shop_id").val()}};
            });
            $("#c-shop_id").on("change",function () {
                $("#c-good_id").selectPageClear();
            });
            Controller.api.bindevent();
        },
        edit: function () {
            // $("#c-good_id").data("params", function () {
            //     return {custom: {shop_id:$("#c-shop_id").val()}};
            // });
            // $("#c-shop_id").on("change",function () {
            //     $("#c-good_id").selectPageClear();
            // });
            Controller.api.bindevent();
        },
        api: {
            bindevent: function () {
                Form.api.bindevent($("form[role=form]"));
            }
        }
    };
    return Controller;
});