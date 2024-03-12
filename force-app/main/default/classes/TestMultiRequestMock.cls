/**
 * @description       : class to create a multiple mock api response for tests
 * @author            : Siberian89
 * @group             : 
 * @last modified on  : 2024-03-12
 * @last modified by  : Siberian89
**/
@isTest
global class TestMultiRequestMock implements HttpCalloutMock {
    private Map<String, HttpCalloutMock> endpointToMockMap;

    global TestMultiRequestMock() {
        this.endpointToMockMap = new Map<String, HttpCalloutMock>();
    }

    global TestMultiRequestMock(Map<String, HttpCalloutMock> endpointToHttpCalloutMockMap) {
        this.endpointToMockMap = endpointToHttpCalloutMockMap;
    }

    global HTTPResponse respond(HTTPRequest req) {
	HttpCalloutMock mock = this.endpointToMockMap.get(req.getEndpoint());
	    if (mock != null) {
	            return mock.respond(req);
            } else {
                throw new HandledException('HTTP callout not supported for test methods');
	    }
    }

    global void addRequestMock(String url, HttpCalloutMock mock) {
        this.endpointToMockMap.put(url, mock);
    }
}