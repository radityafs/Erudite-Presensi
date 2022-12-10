package com.erudite;

import com.erudite.model.PresensiModel;
import com.erudite.Utils.mainUtils;


public class UnitTesting {

	public static void main(String[] args) {
		PresensiModel presensi = new PresensiModel();
		
		presensi.setWaktuMasuk("2022-12-10 07:19:09");
		presensi.setWaktuPulang("2022-12-10 16:15:00");
		
		mainUtils Utils = new mainUtils();
		
		String result = Utils.getResponse(presensi);
		System.out.print(result);
	}

}
