
# Reference to the "lastlocation" node in the Realtime Database
def update_object_location(collection, data_to_store):
    try:
        cctv_data_ref = db.reference(collection)
        # Find the data with the same object_id
        snapshot = cctv_data_ref.order_by_child("object_id").equal_to(data_to_store['object_id']).get()

        if snapshot:
            # Update the existing data with the new data
            for key in snapshot:
                cctv_data_ref.child(key).set(data_to_store)
            print(f"Data with object_id '{data_to_store['object_id']}' updated.")
        else:
            # Add the data as a new entry since no data with the object_id was found
            cctv_data_ref.push(data_to_store)
            print(f"New data added with object_id '{data_to_store['object_id']}'.")
    except Exception as e:
        print(e)

def store_in_firebase(collection, data_to_store):
    try:
        cctv_data_ref = db.reference(collection)
        doc_ref = cctv_data_ref.push(data_to_store)
    except Exception as e:
        print("Error while preserving cctv record", e)
