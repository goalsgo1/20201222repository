package web.mvc;

import java.util.List;

public class ZipCodeDaoSimulation {

	public static void main(String[] args) {
		//ZipCodeDao zcDao = new ZipCodeDao();
		ZipCodeDao zc = new ZipCodeDao();
		List<ZipCodeVO> zList = zc.getZipCodeList("");
		for(ZipCodeVO rzVO:zList) {
			System.out.println(rzVO.getZipcode()+" "+rzVO.getDong()+" "+rzVO.getAddress());
		}
		
		/*
		ZipCodeVO[] zVOS = zcDao.getZipCodeList("공덕동");
		for(ZipCodeVO zVO:zVOS) {
			int zipcode = zVO.getZipcode();
			String address = zVO.getAddress();
			System.out.println(zipcode+"-"+address);
		}
       */
	}
	

}
