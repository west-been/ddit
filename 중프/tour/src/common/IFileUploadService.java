package common;

import javax.servlet.http.HttpServletRequest;

public interface IFileUploadService {
   public void setFileService(String path);
   
   public String getSavePath();
   
   public String getFileName();
   
   public Boolean saveAtchFilePhoto(HttpServletRequest req, String defaultPath);
}