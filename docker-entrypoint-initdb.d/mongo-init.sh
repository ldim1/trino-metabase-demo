set -e

mongosh admin -u admin -p admin <<EOF

db = db.getSiblingDB('local');

db.createCollection('test');

db.test.insertMany([
    {
        name: 'EVENT_A',
        extid: 1
    },
    {
        name: 'EVENT_B',
        extid: 5
    },
    {
        name: 'EVENT_C',
        extid: 17
    }
]);

EOF