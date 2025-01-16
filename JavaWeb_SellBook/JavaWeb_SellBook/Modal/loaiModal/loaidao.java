package loaiModal;

import java.util.ArrayList;

public class loaidao {
	public ArrayList<loai> getloai() {
		ArrayList<loai> ds = new ArrayList<loai>();
		ds.add(new loai("cntt","Cong nghe thong tin"));
		ds.add(new loai("toan","Toan ung dung"));
		ds.add(new loai("ly","Cong nghe dien tu"));
		ds.add(new loai("hoa","Cong nghe khoa hoc"));
		ds.add(new loai("sinh","Sinh hoc ung dung"));
		return ds;
	}
}
