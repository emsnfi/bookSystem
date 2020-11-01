using Forum.Models;
using Forum.Services;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Forum.ViewModels
{
    //相簿頁面用ViewModel
    public class AlbumView
    {
        [DisplayName("上傳圖片")]
        [FileExtensions(ErrorMessage = "所上傳檔案不是圖片")]
        public HttpPostedFileBase upload { get; set; }
        //儲存得檔案陣列
        public List<Album> FileList { get; set; }
        //分頁內容
        public ForPaging Paging { get; set; }
    }

}