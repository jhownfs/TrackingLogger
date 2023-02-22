global with sharing class ILoggerRequest{

  private String ClassName;
  private Blob blobReq;
  private Object objReq;

  global ILoggerRequest(String ClassName){
    this.ClassName = ClassName;
  }

  global ILoggerRequest(String ClassName, Blob blobReq){
     this.ClassName = ClassName;
     this.blobReq = blobReq;
  }

  global String getClassName(){
    return this.className;
  }

  global Blob getRequest(){
    return this.blobReq;
  }

  global void setRequest(Blob aBlobReq){
    this.blobReq = aBlobReq;
  }
}