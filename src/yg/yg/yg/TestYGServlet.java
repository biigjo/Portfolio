package yg.yg.yg;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.StringReader;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpression;
import javax.xml.xpath.XPathFactory;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

@WebServlet("/TestYGServlet")
public class TestYGServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String beginDate = "20210701";
		String endDate = "20210726";
		int pageNo = Integer.parseInt(request.getParameter("pageNo"));
		int pageSize = 9;
		
		String urlStr = "http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/abandonmentPublic";   // URL이라고.
		String queryParams = "?upkind=417000&bgnde="+beginDate+"&endde="+endDate+"&pageNo="+pageNo+"&numOfRows="+pageSize+"&ServiceKey=" + "%2BRAEmNZhWsaIO%2F5p4L3hJ3KXrn%2B3aVb5t3Se1uV5WB0JC%2F73dqpRo89BbxrNeHNOdzZ3RHZzXvEqiPUrQPqnjg%3D%3D"; // Service Key

		String result = null;
		try{
			URL url = new URL(urlStr + queryParams);
			BufferedReader bf;
			bf = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));
			result = bf.readLine();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
		System.out.println(result);
		
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        factory.setNamespaceAware(true);
        DocumentBuilder builder;
        Document doc = null;
        
        Map<String,String> mapResult = new HashMap<String,String>();
        JSONArray jArr = new JSONArray();
        try {
			InputSource is = new InputSource(new StringReader(result));
			builder = factory.newDocumentBuilder();
			doc = builder.parse(is);
			XPathFactory xpathFactory = XPathFactory.newInstance();
			XPath xpath = xpathFactory.newXPath();
			// XPathExpression expr = xpath.compile("/response/body/items/item");
			XPathExpression expr = xpath.compile("//items/item");
			NodeList nodeList = (NodeList) expr.evaluate(doc, XPathConstants.NODESET);
			for (int i = 0; i < nodeList.getLength(); i++) {
	             
				NodeList child = nodeList.item(i).getChildNodes();
	            for (int j = 0; j < child.getLength(); j++) {
	                 Node node = child.item(j);
	                 System.out.println("현재 노드 이름 : " + node.getNodeName());
//	                 System.out.println("현재 노드 타입 : " + node.getNodeType());
	                 System.out.println("현재 노드 값 : " + node.getTextContent());
//	                 System.out.println("현재 노드 네임스페이스 : " + node.getPrefix());
//	                 System.out.println("현재 노드의 다음 노드 : " + node.getNextSibling());
	                 System.out.println("");
	                 mapResult.put(node.getNodeName(), node.getTextContent());
	            }
	            JSONObject jObj = new JSONObject(mapResult);
	            jArr.add(jObj);
	        }
        } catch(Exception e) {
        	e.printStackTrace();
        }
        
        //System.out.println("mapResult : " + mapResult);
		
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		//JSONObject obj = new JSONObject(mapResult);
		
		out.print(jArr);
	}



}
