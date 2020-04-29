package jodd.example.service;

import jodd.db.oom.DbOomQuery;
import jodd.db.oom.sqlgen.DbEntitySql;
import jodd.db.oom.sqlgen.DbSqlBuilder;
import jodd.example.model.Message;
import jodd.example.model.Response;
import jodd.jtx.JtxPropagationBehavior;
import jodd.jtx.meta.Transaction;
import jodd.petite.meta.PetiteBean;

import java.util.List;

import static jodd.db.oom.DbOomQuery.query;
import static jodd.db.oom.sqlgen.DbSqlBuilder.sql;
import static jodd.jtx.JtxPropagationBehavior.PROPAGATION_SUPPORTS;

@PetiteBean
public class AppService {

	@Transaction
	public List<Message> findLastMessages(int count) {
		DbSqlBuilder dbsql =
			sql("select $C{m.*} from $T{Message m} " +
				"order by $m.messageId desc limit :count");
		DbOomQuery dbquery = query(dbsql);
		dbquery.setInteger("count", count);

		return dbquery.list(Message.class);
	}

	@Transaction
	public List<Message> findLastMessagesWithResponses(int count) {
	    DbSqlBuilder dbsql = sql(
	            "select $C{m.*}, $C{m.responses:r.*} " +
	            "from $T{Message m} " +
	            "left join $T{Response r} using ($.messageId) " +
	            "order by $m.messageId desc limit :count");

	    DbOomQuery dbquery = query(dbsql);
	    dbquery.entityAwareMode(true);
	    dbquery.setInteger("count", count);

	    return dbquery.list(Message.class, Response.class);
	}

	@Transaction(propagation=PROPAGATION_SUPPORTS, readOnly=false)
	public void addMessage(Message message) {
	    DbEntitySql
	            .insert(message)
	            .query().autoClose().executeUpdate();
	}

}