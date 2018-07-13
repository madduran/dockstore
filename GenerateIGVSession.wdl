workflow GenerateIGVSession { 

	Array[String] input_files 
	String reference
	String file_name

	call writeXMLfile {
		input: 
			input_files = input_files,
			file_name = file_name,
			reference = reference
	}
	output { 
		File igv_session = writeXMLfile.igv_session
	}
}

# creates an IGV session
# given a list of IGV compatible file paths
task writeXMLfile {
	Array[String] input_files
	String reference
	String file_name

	command {
		bash /usr/writeIGV.sh ${reference} ${sep=" " input_files} > "${file_name}.xml"
	}
	runtime {
		docker: "quay.io/mduran/generate-igv-session:latest"
	}
	output {
		File igv_session = "${file_name}.xml"
	}
}
