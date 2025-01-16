package sachModal;

import java.util.ArrayList;

public class sachbo {
	sachdao sdao = new sachdao();
	ArrayList<sach> ds;

	public ArrayList<sach> getsach() {
		ds = sdao.getsach();
		return ds;
	}

	public ArrayList<sach> TimMa(String maloai) {
		ArrayList<sach> tam = new ArrayList<sach>();
		ds = getsach();

		for (sach s : ds) {
			if (s.getMaloai().toLowerCase().trim().equals(maloai.toLowerCase().trim())) {
				tam.add(s);
			}
		}
		return tam;
	}

	public ArrayList<sach> Tim(String key,String maloai) {
		ArrayList<sach> tam = new ArrayList<sach>();
		ds = getsach();
		for (sach s : ds) {
			boolean ktraLoai = (maloai == null || maloai.isEmpty() || s.getMaloai().equals(maloai));
			if ( ktraLoai && (s.getTensach().toLowerCase().trim().contains(key.toLowerCase().trim())
					|| s.getTacgia().toLowerCase().trim().contains(key.toLowerCase().trim()))) {
				tam.add(s);
			}
		}
		return tam;
	}
	public sach getProductById(String id) {
	        ds = getsach(); 
	        for (sach s : ds) {
	            if (s.getMasach().equals(id)) { 
	                return s; 
	            }
	        }
	        return null;
	}
	public ArrayList<sach> removeProductById(ArrayList<sach> ds, String id) {
	    for (int i = 0; i < ds.size(); i++) {
	        sach s = ds.get(i);
	        if (s.getMasach().equals(id)) {
	            ds.remove(i);
	            break;
	        }
	    }
	    return ds;
	}
}
