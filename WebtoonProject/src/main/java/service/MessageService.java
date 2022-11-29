package service;

import java.util.HashMap;
import java.util.Random;

import org.json.simple.JSONObject;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

/**
 * @class ExampleSend
 * @brief This sample code demonstrate how to send sms through CoolSMS Rest API PHP
 */
public class MessageService {
	public static void sendMessage(String phonenum, String key){
		String api_key = "NCSJEZ4OKRURIYGS";
		String api_secret = "VAMUKAZHEX0ZQW4W6UPKQ7SSEIVIONDB";
		Message coolsms = new Message(api_key, api_secret);

		// 4 params(to, from, type, text) are mandatory. must be filled
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", phonenum);
		params.put("from", "01062663739");
		params.put("type", "SMS");
		params.put("text", "[코리아 웹툰] 인증번호 :"+key);
		params.put("app_version", "test app 1.2"); // application name and version

		try {
			JSONObject obj = (JSONObject) coolsms.send(params);
			System.out.println(obj.toString());
		} catch (CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}
		
	}
}

