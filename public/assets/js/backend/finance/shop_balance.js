define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'finance/shop_balance/index' + location.search,
                    add_url: 'finance/shop_balance/add',
                    edit_url: 'finance/shop_balance/edit',
                    del_url: 'finance/shop_balance/del',
                    multi_url: 'finance/shop_balance/multi',
                    table: 'shop_balance',
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
                        // {field: 'id', title: __('Id')},
                        {field: 'shop.name', title: __('Shop_id')},
                        {field: 'total_price', title: __('Total_price'), operate:'BETWEEN'},
                        {field: 'cash', title: __('Cash'), operate:'BETWEEN'},
                        {field: 'balance', title: __('Balance'), operate:'BETWEEN'},
                        {field: 'balance_', title: __('Balance_'), operate:'BETWEEN'},
                        {field: 'bank', title: __('Bank')},
                        {field: 'bank_number', title: __('Bank_number')},
                        {field: 'name', title: __('Name')},
                        // {field: 'operate', title: __('Operate'), table: table, events: Table.api.events.operate, formatter: Table.api.formatter.operate}
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