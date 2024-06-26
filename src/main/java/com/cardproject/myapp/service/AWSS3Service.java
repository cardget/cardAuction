package com.cardproject.myapp.service;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.amazonaws.services.s3.model.DeleteObjectRequest;


@Service
public class AWSS3Service {
    
    @Autowired
    private AmazonS3 s3Client;
    
    @Value("${aws.s3.bucketName}")
    private String bucketName;
    
    public String uploadObject(MultipartFile multipartFile, String storedFileName) throws IOException {
        
        ObjectMetadata metadata = new ObjectMetadata();
        metadata.setContentLength(multipartFile.getSize());
        metadata.setContentType(multipartFile.getContentType());
        metadata.setContentDisposition("inline");
        
        s3Client.putObject(new PutObjectRequest(bucketName, storedFileName, multipartFile.getInputStream(), metadata));
        return s3Client.getUrl(bucketName, storedFileName).toString();
    }
    
    public void deleteFile(String bucketName, String fileName) {
    	s3Client.deleteObject(new DeleteObjectRequest(bucketName, fileName));
    }
}
