set solr.collection 'truck_event_logs';

DEFINE CustomFormatToISO org.apache.pig.piggybank.evaluation.datetime.convert.CustomFormatToISO();

A = LOAD 'default.truck_events_text_partition_single' USING org.apache.hcatalog.pig.HCatLoader();
B = filter A by (date=='2014-07-25-10');
C = FOREACH B GENERATE  eventkey, 'driverid', driverid, 'truckid', truckid, 'time',  CustomFormatToISO(eventtime, 'yyyy-MM-dd HH:mm:ss.SSS') as time, 'eventtype', eventtype, 'longitude', longitude, 'latitude', latitude,  'correlationid', correlationid,'drivername', drivername,'routeid', routeid,'routename', routename;
--dump C;
STORE C into 'http://george-search01.cloud.hortonworks.com:8983/solr/' using com.lucidworks.hadoop.pig.SolrStoreFunc();
