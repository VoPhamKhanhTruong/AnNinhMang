package sachModal;

import java.util.ArrayList;

public class sachdao {
	public ArrayList<sach> getsach(){
		ArrayList<sach> ds = new ArrayList<sach>();
		//(String masach, String tensach, String tacgia, Long gia, Long soluong, String anh, String maloai)
		ds.add(new sach("s1","Cấu trúc dữ liệu",":e lai",(long)10000,(long)2,"image_sach/b1.jpg","cntt"));
		ds.add(new sach("s2","Cơ sở dữ liệu",":e lai",(long)25000,(long)1,"image_sach/b2.jpg","cntt"));
		ds.add(new sach("s3","Giai Tich",":e lai",(long)20000,(long)2,"image_sach/b3.jpg","ly"));
		ds.add(new sach("s4","Dai so",":e lai",(long)45000,(long)1,"image_sach/b4.jpg","cntt"));
		ds.add(new sach("s5","Hinh hoc",":e lai",(long)50000,(long)2,"image_sach/b5.jpg","hoa"));
		ds.add(new sach("s6","Ly",":e lai",(long)40000,(long)2,"image_sach/b6.jpg","cntt"));
		ds.add(new sach("s7","Hoa",":e lai",(long)20000,(long)2,"image_sach/b7.jpg","cntt"));
		ds.add(new sach("s8","Tieng Anh",":e lai",(long)100000,(long)2,"image_sach/b8.jpg","sinh"));
		return ds;
	}
}
