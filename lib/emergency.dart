void handleCodeEntry(String code) {
  if (code == "123") {
    setState(() {
      _isGreenOn = true;
      _isRedOn = false;
      _isYellowOn = false;
    });
    _postLightStatusToDatabase();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Code Entered"),
          content: Text("Emergency code accepted. Green light turned on."),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  } else {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Invalid Code"),
          content: Text("Please enter a valid emergency code."),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );

      },
    );
  }
  floatingActionButton: FloatingActionButton(
    onPressed: () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          String enteredCode = "";
          return AlertDialog(
            title: Text("Enter Emergency Code"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    enteredCode = value;
                  },
                  decoration: InputDecoration(
                    hintText: "Enter code",
                  ),
                ),
              ],
            ),
            actions: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                ),
                onPressed: () {
                  handleCodeEntry(enteredCode);
                },
                child: Text("Enter"),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Cancel"),
              ),
            ],
          );
        },
      );
    },
    child: Image.asset(
      "assets/img/siren.png",
      height: 30,
    ),
    backgroundColor: Color.fromARGB(255, 207, 232, 235),
  ),
}


