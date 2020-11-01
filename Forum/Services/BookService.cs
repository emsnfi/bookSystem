using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Forum.Models
{
    public class BookService
    {
        MyForumEntities1 db = new MyForumEntities1();
        public List<Book> GetData()
        {
            return (db.Book.ToList());
        }

        public void DBCreate(int id, string name, string author,string account)
        {
            //新增一筆Content資料物件
            Book NewData = new Book();
            var q = db.Book.Where(x => x.Id == id);
            if (q == null || q.Count() == 0)
            {
                NewData.Id = id;
                NewData.name = name;
                NewData.author = author;
                NewData.Account = account;
   
                //將資料加入Content資料表中
                db.Book.Add(NewData);
            }
            else
            {
                Book oldData = q.First();
                //設定新增的值
                oldData.Id = id;
                oldData.name = name;
                oldData.Account = account;
                oldData.author = author;
               
                //將資料加入Content資料表中

                //儲存資料度變更

            }

            db.SaveChanges();
        }
    }
}

