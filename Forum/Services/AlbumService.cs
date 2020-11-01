using Forum.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Forum.Services
{
    public class AlbumService
    {
        //宣告資料庫實體模型物件
        MyForumEntities1 db = new MyForumEntities1();

        #region 查詢相關
        #region 查詢一筆相片
        //藉由標號取的單筆資料的方法
        public Album GetDataById(int Id)
        {
            //回傳根據標號所取得的資料
            return db.Album.Find(Id);
        }
        #endregion

        #region 查詢相片陣列資料
        //根據分頁以及搜尋來取得資料陣列的方法
        public List<Album> GetDataList(ForPaging Paging)
        {
            //設定要接受全部搜尋資料的物件
            IQueryable<Album> SearchData = GetAllDataList(Paging);
            //先排序再根據分頁來回傳所需的部分資料陣列
            return SearchData.OrderByDescending(p => p.CreateTime)
               .Skip((Paging.NowPage - 1) * Paging.ItemNum).Take(Paging.ItemNum).ToList();
        }
        //無搜尋值的搜尋資料方法
        public IQueryable<Album> GetAllDataList(ForPaging Paging)
        {
            //宣告要回傳的搜尋資料為資料庫中的Album資料表
            IQueryable<Album> Data = db.Album;
            //計算所需的總頁面
            Paging.MaxPage = Convert.ToInt32(Math.Ceiling(
          Convert.ToDouble(Data.Count()) / Paging.ItemNum));
            //重新設定正確的頁數，避免有不正確值傳入
            Paging.SetRightPage();
            //回傳搜尋資料
            return Data;
        }
        #endregion
        #endregion

        #region 上傳檔案
        public void UploadFile(string FileName, string Url, int Size,
            string Type, string Account)
        {
            //宣告新FileContent資料表資料
            Album newFile = new Album();
            //設定內容
            newFile.FileName = FileName;
            newFile.Url = Url;
            newFile.Size = Size;
            newFile.Type = Type;
            newFile.Account = Account;
            newFile.CreateTime = DateTime.Now;
            //新增至資料庫中
            db.Album.Add(newFile);
            //儲存資料庫變更
            db.SaveChanges();
        }
        #endregion
    }
}