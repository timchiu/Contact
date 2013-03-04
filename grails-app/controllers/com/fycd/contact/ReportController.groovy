package com.fycd.contact

import org.apache.poi.ss.usermodel.Cell
import org.apache.poi.ss.usermodel.CellStyle
import org.apache.poi.ss.usermodel.Color
import org.apache.poi.ss.usermodel.Row
import org.apache.poi.ss.usermodel.Sheet
import org.apache.poi.ss.usermodel.Workbook
import org.apache.poi.ss.usermodel.WorkbookFactory


class ReportController {

	def isSpeaker(TaoMember m, String lang) {
		if (m.languages) {
			for (String l : m.languages) {
				if (l.equalsIgnoreCase(lang) || l.contains(lang)) {
					return true
				}
			}
			return false
		} else {
			return false
		}
	}

	def pauline = {
		def emailList = []
		def cantonese51 = []
		def cantonese31 = []
		def cantoneseRest = []
		def chinese51 = []
		def chinese31 = []
		def chineseRest = []
		def other51 = []
		def other31 = []
		def otherRest = []

		def results = TaoMember.list(params)
		for (TaoMember m : results) {
			if (m.id > 200) {
				if (m.taoReceivingTemple == null || (m.taoReceivingTemple?.id in [2, 4, 5, 9])) {
					// SF Temples only
					if (m.email != null) {
						emailList << m
					} else if (isSpeaker(m, message(code: "taoMember.languages.cantonese").toString()) || isSpeaker(m, "cantonese")) {
						if (m.age != null && m.age >= 51) {
							cantonese51 << m
						} else if (m.age != null && m.age >= 31) {
							cantonese31 << m
						} else {
							cantoneseRest << m
						}
					} else if (isSpeaker(m, message(code: "taoMember.languages.mandarin").toString()) || isSpeaker(m, "Mandarin")) {
						if (m.age != null && m.age >= 51) {
							chinese51 << m
						} else if (m.age != null && m.age >= 31) {
							chinese31 << m
						} else {
							chineseRest << m
						}
					} else {
						if (m.age != null && m.age >= 51) {
							other51 << m
						} else if (m.age != null && m.age >= 31) {
							other31 << m
						} else {
							otherRest << m
						}
					}
				}
			}
		}

		render "id \t name \t gender \t introducer \t guarantor \t contact person \t contact person id \t contact group \t contact group id \t languages \t age \t email \t tao seminar \t notes \n"
		outputMemberTsv(emailList, "With Email \n")
		outputMemberTsv(cantonese51, "Cantonese 51+ \n")
		outputMemberTsv(cantonese31, "Cantonese 31+ \n")
		outputMemberTsv(cantoneseRest, "Cantonese * \n")
		outputMemberTsv(chinese51, "Mandarin 51+ \n")
		outputMemberTsv(chinese31, "Mandarin 31+ \n")
		outputMemberTsv(chineseRest, "Mandarin * \n")
		outputMemberTsv(other51, "Others 51+ \n")
		outputMemberTsv(other31, "Others 31+ \n")
		outputMemberTsv(otherRest, "Others * \n")
	}

	def outputMemberTsv(members, title) {
		render title
		for (TaoMember m : members) {
			render m.toTsv() + "\n"
		}
	}

	def getLanguages = {
		def english = message(code: "taoMember.languages.english")
		def mandarin = message(code: "taoMember.languages.mandarin")
		def cantonese = message(code: "taoMember.languages.cantonese")
		def vietnamese = message(code: "taoMember.languages.vietnamese")
		return [
			mandarin,
			english,
			cantonese,
			vietnamese
		]
	}

	def getSqlUpdates = {
		InputStream inp = new FileInputStream("/Users/tchiu/Desktop/Pauline_v2_SF_Temples_and_No_Temples_update.xls");
		//InputStream inp = new FileInputStream("workbook.xlsx");

		Workbook wb = WorkbookFactory.create(inp)
		Sheet sheet = wb.getSheetAt(0)
		int numUpdates = 0
		int rowCount = 0
		int cellCount = 0
		for (Row row : sheet) {
			Cell cell0 = row.getCell(0);
			CellStyle style = cell0.getCellStyle();
			if (style != null) {
//				render style
//				Color color = style.getFillForegroundColorColor();
				Color color = style.getFillBackgroundColorColor()
//				render color.getHexString()
			}
			
			if (cell0.getCellType() == Cell.CELL_TYPE_NUMERIC) {
				int userId = cell0.getNumericCellValue()
				int contactPersonId = -1
				int contactGroupId = -1
				
				Cell cell6 = row.getCell(6)
				if (cell6 != null && cell6.getCellType() == Cell.CELL_TYPE_NUMERIC) {
					contactPersonId = cell6.getNumericCellValue()
				}
				
				Cell cell8 = row.getCell(8)
				if (cell8 != null && cell8.getCellType() == Cell.CELL_TYPE_NUMERIC) {
					contactGroupId = cell8.getNumericCellValue()
				}

				if (contactPersonId > 0 && contactGroupId > 0) {
					render "update user set contact_person_id = ${contactPersonId}, contact_group_id = ${contactGroupId} where id = ${userId}; \n"
					numUpdates++
				} else if (contactPersonId > 0 && contactGroupId <= 0) {
					render "update user set contact_person_id = ${contactPersonId}, contact_group_id = null where id = ${userId}; \n"
					numUpdates++
				} else if (contactPersonId <= 0 && contactGroupId > 0) {
					render "update user set contact_person_id = null, contact_group_id = ${contactGroupId} where id = ${userId}; \n"
					numUpdates++
				} else if (contactPersonId <= 0 && contactGroupId <= 0) {
					render "update user set contact_person_id = null, contact_group_id = null where id = ${userId}; \n"
					numUpdates++
				} 
	
			}
			
			rowCount++
		}
		render "-- ${numUpdates} SQL updates generated."
	}
}
