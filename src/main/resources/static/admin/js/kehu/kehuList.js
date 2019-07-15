layui.use(['layer', 'form', 'table', 'laytpl'], function () {
    var layer = layui.layer,
        $ = layui.jquery,
        form = layui.form,
        table = layui.table,
        t,               //表格数据变量
        t1;

    t = {
        elem: '#kehuTable',
        url: '/kehu/list',
        method: 'post',
        page: { //支持传入 laypage 组件的所有参数（某些参数除外，如：jump/elem） - 详见文档
            layout: ['limit', 'count', 'prev', 'page', 'next', 'skip'], //自定义分页布局
            //,curr: 5 //设定初始在第 5 页
            groups: 6, //只显示 1 个连续页码
            first: "首页", //显示首页
            last: "尾页", //显示尾页
            limits: [30, 50, 100, 150]
        },
        cols: [[
            {type: 'checkbox'},
            {field: 'phone', title: '手机号码', align: 'center'},
            {field: 'name', title: '姓名', align: 'center'},
            {field: 'sex', title: '性別', align: 'center',templet: '#kehuStatus'},
            {field: 'createDate', title: '注册时间', align: 'center'},
            {field: 'comment', title: '备注', align: 'center', event: 'setComment', style: 'cursor: pointer;'},
            {title: "查看下级", fixed: 'right', align: 'center', toolbar: '#userBar',style: 'cursor: pointer;'}
        ]]
    };
    t1 = {
        elem: '#xiaji',
        url: '/kehu/xiaji?phone='+$("#phone").val(),
        method: 'post',
        page: { //支持传入 laypage 组件的所有参数（某些参数除外，如：jump/elem） - 详见文档
            layout: ['limit', 'count', 'prev', 'page', 'next', 'skip'], //自定义分页布局
            //,curr: 5 //设定初始在第 5 页
            groups: 6, //只显示 1 个连续页码
            first: "首页", //显示首页
            last: "尾页", //显示尾页
            limits: [3, 10, 20, 30]
        },
        cols: [[
            {field: 'phone', title: '手机号码', align: 'center'},
            {field: 'name', title: '姓名', align: 'center'},
        ]]
    };
    table.render(t);
    table.render(t1);
    //监听工具条
    table.on('tool(kehuList)', function (obj) {
        var data = obj.data;
        var collectId = null;


        //监听单元格修改事件
        if (obj.event === 'setComment') {
            layer.prompt({
                formType: 2,
                title: '备注',
                value: data.comment
            }, function (value, index) {
                layer.close(index);
                //这里一般是发送修改的Ajax请求
                $.ajax({
                    type: "POST",
                    url: "/kehu/setComment",
                    data: {
                        phone: data.phone,
                        comment: value
                    },
                    async: false,
                    datatype: "json",

                    success: function (res) {
                        layer.msg('修改成功!', {icon: 1});
                    }
                });
                //同步更新表格和缓存对应的值
                setTimeout(function () {  //使用  setTimeout（）方法设定定时2000毫秒
                    window.location.reload();//页面刷新
                }, 2000);
                /* obj.update({
                     hiveName: value
                 });*/
            });
        }
        if (obj.event === 'xiaji') {
            layer.open({
                type: 2
                , title: '下级列表'
                , content: "/kehu/xiaji?phone=" + data.phone
                , skin: 'layui-layer-molv'
                , area: ['400px', '500px']

            });

        }






    });






    $('.layui-btn.layuiadmin-btn-list').on('click', function () {
        var type = $(this).data('type');
        active[type] ? active[type].call(this) : '';
    });

    //搜索
    form.on("submit(searchForm)", function (data) {
        t.where = data.field;
        table.reload('kehuTable', t);
        return false;
    });

});