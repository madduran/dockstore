workflow GenerateIGVSession { 

	# these should be gs:// paths to the files
	Array[String] input_files 
	# hg19 or hg38
	String reference_version
	# name of output xml
	String file_name

	call writeXMLfile {
		input: 
			input_files = input_files,
			file_name = file_name,
			reference_version = reference_version
	}
	output { 
		File igv_session = writeXMLfile.igv_session
	}
}

# creates an IGV session
# given a list of IGV compatible file paths
task writeXMLfile {
	Array[String] input_files
	String reference_version
	String file_name

	command {
		bash /usr/writeIGV.sh ${reference_version} ${sep=" " input_files} > "${file_name}.xml"
	}
	runtime {
		docker: "quay.io/mduran/generate-igv-session:latest"
	}
	output {
		File igv_session = "${file_name}.xml"
	}
}
