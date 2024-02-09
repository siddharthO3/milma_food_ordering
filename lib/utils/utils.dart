String? validateName(String? name) {
  final nameRegex = RegExp(r'^[a-zA-Z\s]{1,50}$');
  if (name == null) {
    return 'Name cannot be null';
  } else if (name.isEmpty) {
    return 'Name should be at least 3 characters';
  } else if (!nameRegex.hasMatch(name)) {
    return 'Please enter a valid name';
  } else {
    return null;
  }
}

String? validateHostelName(String? name) {
  if (name == null) {
    return 'Name cannot be null';
  } else if (name.isEmpty) {
    return 'Name should be at least 3 characters';
  } else if ((name!= 'meenachill' || (name!= 'Meenachill' ) || (name!= 'Manimala') || (name!= 'manimala') || (name!= 'Sahyadri')) || (name!= 'sahyadri') || (name!= 'Anamudi') || (name!= 'anamudi')) {
    return 'Please enter a valid name';
  } else {
    return null;
  }
}

String? validateNumber(String? number) {
  if (number == null) {
    return 'Please type a number';
  }
  if (number.length < 10) {
    return 'Your number should at least be 10 characters';
  }
  return null;
}

String? validateRollNumber(String? Rollnumber) {
  // if (Rollnumber == null) {
  //   return 'Please type a number';
  // }
  // if (Rollnumber.length < 10) {
  //   return 'Your number should at least be 10 characters';
  // }
  // return null;
}