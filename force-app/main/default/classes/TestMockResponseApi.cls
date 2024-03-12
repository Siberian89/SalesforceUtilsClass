/**
 * @description       : class to create a mock api response for tests
 * @author            : Siberian89
 * @group             : 
 * @last modified on  : 2024-03-12
 * @last modified by  : Siberian89
**/
@isTest
global class TestMockResponseApi implements HttpCalloutMock{
    
    private Integer statusCode {get;set;}
    private String status {get;set;}
    private String body {get;set;}

	global TestMockResponseApi(){
		this.statusCode = 200;
        this.status = 'Success';
        this.body = '{}';
	}

	global TestMockResponseApi(Integer statusCode, String status, String body){
		this.statusCode = statusCode;
        this.status = status;
        this.body = body;
	}
    
    global HTTPResponse respond(HTTPRequest req) {
		HttpResponse res = new HttpResponse();
        
        res.setStatusCode(this.statusCode);
        res.setStatus(this.status);
        res.setBody(this.body);
        
        return res;
    }
    
}