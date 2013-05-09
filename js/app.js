(function($){
    $(document).ready(function(){

        var initBtns = function(){
            $('a[href^=#CMD]').off('click').on('click',function(e){
                e.stopPropagation();
                e.preventDefault();
                var target = $(e.target);
                if(target.attr('href')){
                    var cmd = target.attr('href').split('#CMD:')[1];
                    switch (cmd){
                        case 'HOME':
                            location.href = './';
                            break;
                        case 'INSTALL':
                            location.href = './install.asp';
                            break;
                        case 'ABOUT':
                            location.href = './about.asp';
                            break;
                        case 'BEGIN':
                            location.href = './main.asp';
                            break;
                        case 'SEARCH':
                            var keyword = $('#search').val().trim();
                            var api = './data.asp';
                            if(keyword){
                                api+='?keyword='+keyword;
                            }
                            $.ajax({url:api,dataType:'json',success:function(data){
                                initDataTable(data);
                            }})
                            break;
                        case 'ADD':
                            $('#add-box').modal({
                                keyboard:true,
                                show:true
                            })
                            break;
                        case 'DEL':
                            var id = target.closest('tr').find('td').eq(0).text();
                            $.ajax({
                                url:'./data.asp?action=del&id='+id,
                                success:function(data){
                                    $.ajax({url:'./data.asp',dataType:'json',success:function(data){
                                        initDataTable(data)
                                    }})
                                }
                            })
                            break;
                        case 'EDIT':
                            $('#edit-box').modal({
                                keyboard:true,
                                show:true
                            })
                            var meta = target.closest('tr').find('td');
                            meta.each(function(k,v){
                                switch (k){
                                    case 0:
                                        $('#edit-box').attr('data-id',$(v).text());
                                        break;
                                    case 1:
                                        $('#edit-box input#edit-username').val($(v).text())
                                        break;
                                    case 2:
                                        $('#edit-box input#edit-useremail').val($(v).text())
                                        break;
                                    case 3:
                                        $('#edit-box input#edit-userphone').val($(v).text())
                                        break;
                                }
                            });
                            break;
                        case 'CANCEL':
                            resetBox();
                            break;
                        case 'DO-ADD':
                            var url;
                            url = './data.asp?action=add';
                            $('#add-box input').each(function(k,v){
                                if(!$(v).val().trim()){
                                    url = './data.asp';
                                }
                                else
                                {
                                    switch($(v).attr('id')){
                                        case 'add-username':
                                            url = url+ '&user=' + $(v).val();
                                            break;
                                        case 'add-useremail':
                                            url = url+ '&email=' + $(v).val();
                                            break;
                                        case 'add-userphone':
                                            url = url+ '&phone=' + $(v).val();
                                            break;
                                    }
                                }
                            });

                            $.ajax({
                                url:url,
                                success:function(data){
                                    $.ajax({url:'./data.asp',dataType:'json',success:function(data){
                                        initDataTable(data);
                                        resetBox();
                                    }})
                                }
                            })
                            break;
                        case 'DO-EDIT':
                            var url;
                            var id = $('#edit-box').attr('data-id');
                            url = './data.asp?action=edit&id=' + id;
                            $('#edit-box input').each(function(k,v){
                                if(!$(v).val().trim()){
                                    url = './data.asp';
                                }
                                else
                                {
                                    switch($(v).attr('id')){
                                        case 'edit-username':
                                            url = url+ '&user=' + $(v).val();
                                            break;
                                        case 'edit-useremail':
                                            url = url+ '&email=' + $(v).val();
                                            break;
                                        case 'edit-userphone':
                                            url = url+ '&phone=' + $(v).val();
                                            break;
                                    }
                                }
                            });

                            $.ajax({
                                url:url,
                                success:function(data){
                                    $.ajax({url:'./data.asp',dataType:'json',success:function(data){
                                        initDataTable(data);
                                        resetBox();
                                    }})
                                }
                            })
                            break;
                    }
                }
            });
        }
        initBtns();

        var mode = $('body').attr('data-page');
        switch (mode){
            case 'MAIN':
                $.ajax({url:'./data.asp',dataType:'json',success:function(data){
                    initDataTable(data)
                }})
                break;
        }

        var searchBox = $('#search-box');
        searchBox.on('keydown',function(e){
            if(e.keyCode == 13){
                var keyword = $('#search').val().trim();
                var api = './data.asp';
                if(keyword){
                    api+='?keyword='+keyword;
                }
                $.ajax({url:api,dataType:'json',success:function(data){
                    initDataTable(data);
                }})
            }
        })

        var resetBox = function(){
            $('#add-box').modal('hide');
            $('#add-box input').each(function(k,v){
                $(v).val('');
            });
            $('#edit-box').modal('hide');
            $('#edit-box input').each(function(k,v){
                $(v).val('');
            });
        }

        var initDataTable = function(data){
            $('table#main-table tbody tr').remove();
            var html = [];
            if(data.length){
                for(var oo in data){
                    html.push('<tr><td>'+data[oo]['id']+'</td><td>'+data[oo]['name']+'</td><td>'+data[oo]['email']+'</td><td>'+data[oo]['phone']+'</td><td class="action-td"><a href="#CMD:EDIT" class="btn btn-warning btn-mini btn-edit">修改</a><a href="#CMD:DEL" class="btn btn-error btn-mini btn-del">删除</a></td></tr>')
                }
            }else{
                html.push('<tr><td colspan=5><p style="text-align:center;margin:0;">无符合条件的记录。.</p></td></tr>');
            }
            html = html.join('');
            $('table#main-table tbody').append(html);
            initBtns();
        }

    });
})(jQuery)