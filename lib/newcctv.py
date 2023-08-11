def store_in_firebase(collection, data_to_store):
    try:
        cctv_data_ref = db.reference(collection)
        cctv_data_ref.push(data_to_store)
        print(f"Data added with object_id '{data_to_store['object_id']}'.")
    except Exception as e:
        print("Error while preserving cctv record", e)

def update_object_location(collection, data_to_store):
    try:
        cctv_data_ref = db.reference(collection)
        snapshot = cctv_data_ref.order_by_child("object_id").equal_to(data_to_store['object_id']).get()

        if snapshot:
            key_to_update = next(iter(snapshot.keys()))
            cctv_data_ref.child(key_to_update).update(data_to_store)
            print(f"Data with object_id '{data_to_store['object_id']}' updated.")
        else:
            store_in_firebase(collection, data_to_store)
    except Exception as e:
        print(e)

# Example usage
if __name__ == "__main__":
    import firebase_admin
    from firebase_admin import credentials, db

    # Initialize Firebase
    cred = credentials.Certificate("path/to/your/credentials.json")
    firebase_admin.initialize_app(cred, {
        'databaseURL': 'https://your-database-name.firebaseio.com'
    })

    data_to_store = {
        'object_id': '12345',
        'location': 'Some Location',
        'other_data': 'Other Data'
    }

    collection = 'cctv_data'
    update_object_location(collection, data_to_store)
