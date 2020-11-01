﻿using Forum.Models;
using Forum.Services;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Forum.ViewModels
{
    //文章用ViewModel
    public class BookView
    {
        [DisplayName("發表人")]
        public string Account { get; set; }

        [DisplayName("書籍編號")]
        public int Id { get; set; }

        [DisplayName("書名")]
        [Required(ErrorMessage = "請輸入標題")]
        [StringLength(50, ErrorMessage = "書名長度最多50字元")]
        public string name { get; set; }

        [DisplayName("作者")]
        [Required(ErrorMessage = "請輸入作者")]
        public string author { get; set; }


        [DisplayName("新增時間")]
        public DateTime time { get; set; }
    }

}