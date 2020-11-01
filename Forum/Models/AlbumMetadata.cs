using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Forum.Models
{
    //定義Album資料表的驗證
    [MetadataType(typeof(AlbumMetadata))]
    public partial class Album
    {
        private class AlbumMetadata
        {
            [DisplayName("編號")]
            public int Alb_Id { get; set; }

            [DisplayName("檔名")]
            public string FileName { get; set; }

            [DisplayName("路徑")]
            public string Url { get; set; }

            [DisplayName("大小(Byte)")]
            public int Size { get; set; }

            public string Type { get; set; }

            [DisplayName("上傳者")]
            public string Account { get; set; }

            [DisplayName("上傳時間：")]
            public DateTime CreateTime { get; set; }
        }
    }
}