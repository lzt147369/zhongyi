var index = parent.layer.getFrameIndex(window.name); //当前窗口索引
layui.use(['form', 'jquery', 'layer'], function () {
    var form = layui.form,
        $ = layui.jquery,
        layer = layui.layer;

    form.on("submit(editprice)", function (data) {
        if (data.field.id == null) {
            layer.msg("id不存在");
            return false;
        }


        var loadIndex = layer.load(2, {
            shade: [0.3, '#333']
        });
        $.ajax({
            type: "POST",
            url: "/price/edit",
            dataType: "json",
            contentType: "application/json",
            data: JSON.stringify(data.field),
            success: function (res) {
                layer.close(loadIndex);
                if (res.success) {
                    parent.layer.msg("编辑成功！", {time: 1500}, function () {
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