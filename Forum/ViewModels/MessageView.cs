using Forum.Models;
using Forum.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Forum.ViewModels
{
    public class MessageView //留言用ViewModel
    {
        //顯示資料陣列
        public List<Message> DataList { get; set; }
        //分頁內容
        public ForPaging Paging { get; set; }
        //文章編號
        public int A_Id { get; set; }
    }

}