layui.use(['form', 'jquery', 'layer'], function () {
    var form = layui.form,
        $ = layui.jquery,
        layer = layui.layer;   //默认启用用户

    form.on("submit(addBaggage)", function (data) {
        var loadIndex = layer.load(2, {
            shade: [0.3, '#333']
        });

        $.ajax({
            type: "POST",
            url: "/baggage/add",
            dataType: "json",
            contentType: "application/json",
            data: JSON.stringify(data.field),
            success: function (res) {
                layer.close(loadIndex);
                if (res.success) {
                    parent.layer.msg("行李类型添加成功!", {time: 1500}, function () {
                        //刷新父页面
                        parent.location.reload();
                    });
                } else {
                    layer.msg(res.message);
                }
            }
        });
        return false;
    });


});