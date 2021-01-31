import 'package:academy_app/models/user.dart';
import 'package:academy_app/screens/language_screen.dart';
import 'package:academy_app/screens/wallet_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/edit_profile_screen.dart';
import '../screens/edit_password_screen.dart';
import '../constants.dart';
import './custom_text.dart';
import '../providers/auth.dart';

class AccountListTile extends StatelessWidget {
  final String titleText;
  final IconData icon;
  final String actionType;
  User user;
  AccountListTile({
    @required this.titleText,
    @required this.icon,
    @required this.actionType,
    @optionalTypeArgs this.user
  });

  void _actionHandler(BuildContext context) {
    if (actionType == 'logout') {
      Provider.of<Auth>(context, listen: false).logout().then((_) =>
          Navigator.pushNamedAndRemoveUntil(context, '/home', (r) => false));
    } else if (actionType == 'edit') {
      Navigator.of(context).pushNamed(EditProfileScreen.routeName);
    } else if (actionType == 'change_password') {
      Navigator.of(context).pushNamed(EditPasswordScreen.routeName);
    }
    else if (actionType == 'wallet') {
      Navigator.of(context).pushNamed(WalletScreen.routeName,arguments: user);
    }else if(actionType=='language'){
      Navigator.of(context).pushNamed(LanguageScreen.routeName);
    }


  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: kLightBlueColor,
        radius: 20,
        child: Padding(
          padding: EdgeInsets.all(6),
          child: FittedBox(
            child: Icon(icon),
          ),
        ),
      ),
      title: Customtext(
        text: titleText,
        colors: kTextColor,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      trailing: IconButton(
        icon: Icon(Icons.arrow_forward_ios),
        onPressed: () => _actionHandler(context),
        color: Colors.grey,
      ),
    );
  }
}
