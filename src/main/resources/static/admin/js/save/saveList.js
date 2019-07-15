layui.use(['layer', 'form', 'table', 'laytpl'], function () {
    var layer = layui.layer,
        $ = layui.jquery,
        form = layui.form,
        table = layui.table,
        t;                  //表格数据变量

    t = {
        elem: '#saveTable',
        url: '/save/list',
        method: 'post',
        page: { //支持传入 laypage 组件的所有参数（某些参数除外，如：jump/elem） - 详见文档
            layout: ['limit', 'count', 'prev', 'page', 'next', 'skip'], //自定义分页布局
            //,curr: 5 //设定初始在第 5 页
            groups: 6, //只显示 1 个连续页码
            first: "首页", //显示首页
            last: "尾页", //显示尾页
            limits: [10, 20, 30, 40]
        },
        cols: [[
            {type: 'checkbox'},
            {field: 'saveTypeName', title: '存储方式', align: 'center'},
            {title: "操作", fixed: 'right', align: 'center', toolbar: '#saveBar'}
        ]]
    };
    table.render(t);


    table.on('tool(saveList)', function (obj) {
        var data = obj.data;

        if (obj.event === 'edit') {
            layer.open({
                type: 2
                , title: '编辑数据'
                , content: "/save/edit?id=" + data.id
                , maxmin: true
                , skin: 'layui-layer-molv'
                , area: ['600px', '250px']
                , yes: function (index, layero) {
                    //点击确认触发 iframe 内容中的按钮提交
                    var submit = layero.find('iframe').contents().find("#layuiadmin-app-form-submit");
                    submit.click();
                }
            });

        }

        if (obj.event === "del") {
            layer.confirm("你确定要删除该数据吗?", {btn: ['确定', '取消']},
                function () {
                    $.post("/save/delete", {"id": data.id}, function (res) {
                        if (res.success) {
                            layer.msg("删除成功", {time: 1000}, function () {
                                table.reload('saveTable', t);
                            });
                        } else {
                            layer.msg(res.message);
                        }

                    });
                }
            );
        }
    });

    //功能按钮
    var active = {
        addsave: function () {
            layer.open({
                type: 2
                , title: '添加信息'
                , content: '/save/add'
                , maxmin: true
                , skin: 'layui-layer-molv'
                , area: ['600px', '250px']
                , yes: function (index, layero) {
                    //点击确认触发 iframe 内容中的按钮提交
                    var submit = layero.find('iframe').contents().find("#layuiadmin-app-form-submit");
                    submit.click();
                }
            });
        },
        deleteSome: function () {
            var checkStatus = table.checkStatus('saveTable'),
                data = checkStatus.data;
            if (data.length > 0) {
                layer.confirm("你确定要删除这些信息么？", {btn: ['确定', '取消']},
                    function () {
                        var deleteindex = layer.msg('删除中，请稍候', {icon: 16, time: false, shade: 0.8});
                        $.ajax({
                            type: "POST",
                            url: "/save/deleteSome",
                            dataType: "json",
                            contentType: "application/json",
                            data: JSON.stringify(data),
                            success: function (res) {
                                layer.close(deleteindex);
                                if (res.success) {
                                    layer.msg("删除成功", {time: 1000}, function () {
                                        table.reload('saveTable', t);
                                    });
                                } else {
                                    layer.msg(res.message);
                                }
                            }
                        });
                    }
                )
            } else {
                layer.msg("请选择需要删除的数据", {time: 1000});
            }
        }
    };


    $('.layui-btn.layuiadmin-btn-list').on('click', function () {
        var type = $(this).data('type');
        active[type] ? active[type].call(this) : '';
    });



});