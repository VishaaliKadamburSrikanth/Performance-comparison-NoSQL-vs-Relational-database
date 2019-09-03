package processing;

import com.mongodb.MongoClient;
import com.mongodb.client.MongoDatabase;

public class MongodbConnection {
	public MongoDatabase mongodbConnection() {
		
		MongoClient mongo = new MongoClient("localhost", 27017);
		MongoDatabase database = mongo.getDatabase("casestudy");		
		return database;
	}

	}
