package com.example.emptycompose

import androidx.compose.foundation.Image
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.text.KeyboardOptions
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Visibility
import androidx.compose.material.icons.filled.VisibilityOff
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.runtime.saveable.rememberSaveable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.text.input.KeyboardType
import androidx.compose.ui.text.input.PasswordVisualTransformation
import androidx.compose.ui.text.input.VisualTransformation
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import com.example.emptycompose.ui.theme.EmptycomposeTheme

@OptIn(ExperimentalMaterial3Api::class)
@Composable
@Preview(name = "LoginPage - Light Mode")
fun LoginPage() {

    var email by rememberSaveable { mutableStateOf("") }
    var password by rememberSaveable { mutableStateOf("") }
    var passwordHidden by rememberSaveable { mutableStateOf(true) }

    EmptycomposeTheme {
        Surface(
            modifier = Modifier.fillMaxSize(),
            color = MaterialTheme.colorScheme.background
        ) {
            Box(contentAlignment = Alignment.Center) {
                Card(
                    modifier = Modifier
                        .fillMaxWidth(0.9f)
                ) {
                    Column(Modifier.padding(10.dp)) {
                        Text(
                            text = "Sign In",
                            style = MaterialTheme.typography.titleLarge
                        )
                        TextField(
                            value = email,
                            onValueChange = { email = it },
                            label = { Text("E-mail") },
                            singleLine = true
                        )

                        TextField(
                            value = password,
                            onValueChange = { password = it },
                            singleLine = true,
                            label = { Text("Enter password") },
                            visualTransformation =
                            if (passwordHidden) PasswordVisualTransformation() else VisualTransformation.None,
                            keyboardOptions = KeyboardOptions(keyboardType = KeyboardType.Password),
                            trailingIcon = {
                                IconButton(onClick = { passwordHidden = !passwordHidden }) {
                                    val visibilityIcon =
                                        if (passwordHidden) Icons.Filled.Visibility else Icons.Filled.VisibilityOff
                                    // Please provide localized description for accessibility services
                                    val description =
                                        if (passwordHidden) "Show password" else "Hide password"
                                    Icon(
                                        imageVector = visibilityIcon,
                                        contentDescription = description
                                    )
                                }
                            }
                        )
                        Spacer(modifier = Modifier.height(4.dp))
                        SignInWithGoogle()
                    }

                }
            }

        }
    }

}


@OptIn(ExperimentalMaterial3Api::class)
@Composable
@Preview(name = "SignInWithGoogle - Light Mode")
private fun SignInWithGoogle() {
    val googleIcon = com.google.android.gms.base.R.drawable.googleg_standard_color_18
    var value by remember { mutableStateOf(false) }

    Box(contentAlignment = Alignment.Center) {
        Surface(
            modifier = Modifier.padding(all = 8.dp),
            color = MaterialTheme.colorScheme.errorContainer,
            shape = CardDefaults.elevatedShape
        ) {
        }
        ElevatedCard(
            onClick = {
                value = !value
            },
            modifier = Modifier.padding(all = 3.dp),
        ) {
            Row(
                horizontalArrangement = Arrangement.Center,
                verticalAlignment = Alignment.CenterVertically,
                modifier = Modifier
                    .padding(horizontal = 8.dp, vertical = 8.dp)

            ) {
                Image(
                    painter = painterResource(id = googleIcon),
                    contentDescription = "google sign in"
                )
                Spacer(modifier = Modifier.width(8.dp))
                Text(
                    text = "Sign in with google",
                    style = MaterialTheme.typography.labelLarge
                )

            }
        }
    }
}