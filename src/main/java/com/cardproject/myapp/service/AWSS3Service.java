package com.cardproject.myapp.service;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;

@Service
public class AWSS3Service {
	
	@Autowired
	private AmazonS3 s3Client;
	
	private String bucketName = "shinhan.cardauction";
	
	public String uploadObject(MultipartFile multipartFile, String storedFileName) throws IOException {
		
		ObjectMetadata metadata = new ObjectMetadata();
        metadata.setContentLength(multipartFile.getSize());
        metadata.setContentType(multipartFile.getContentType());
        metadata.setContentDisposition("inline");
        
		s3Client.putObject(new PutObjectRequest(bucketName, storedFileName, multipartFile.getInputStream(), metadata));
		return s3Client.getUrl(bucketName, storedFileName).toString();
	}

}
