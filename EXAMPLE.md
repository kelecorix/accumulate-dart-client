# Examples

See various examples on how to use library

## 1. Generate Lite Identity

```dart
ACMEClient client = ACMEClient("https://testnet.accumulatenetwork.io/v3");
var lid = LiteIdentity(Ed25519KeypairSigner.generate());
```

## 2. Add ACME token from Faucet

```dart
ACMEClient client = ACMEClient("https://testnet.accumulatenetwork.io/v3");
var lid = LiteIdentity(Ed25519KeypairSigner.generate());
final res = await client.faucet(lid.acmeTokenAccount);
```


## 3. Add Credits to Lite Identity

```dart
int creditAmount = 60000;
AddCreditsParam addCreditsParam = AddCreditsParam();  
addCreditsParam.recipient = lid.url;  
addCreditsParam.amount = (creditAmount * pow(10, 8)) ~/ oracle;  
addCreditsParam.oracle = await client.valueFromOracle();  
await client.addCredits(lid.url, addCreditsParam, lid);
```


## 4. Send ACME token to another Lite ACME token account

```dart
int sendToken = 10000;
final recipient =  
    LiteIdentity(Ed25519KeypairSigner.generate()).acmeTokenAccount;  
SendTokensParam sendTokensParam = SendTokensParam();  
TokenRecipientParam tokenRecipientParam = TokenRecipientParam();  
tokenRecipientParam.amount = sendToken * pow(10, 8);  
tokenRecipientParam.url = recipient;  
sendTokensParam.to = List<TokenRecipientParam>.from([tokenRecipientParam]);  
await client.sendTokens(lid.acmeTokenAccount, sendTokensParam, lid);

```

## 5. Create ADI
```dart
final identitySigner = Ed25519KeypairSigner.generate();  
var identityUrl = "acc://kelecorix-some-adi-name";  
final bookUrl = identityUrl + "/kelecorix-some-book-name";  
  
CreateIdentityParam createIdentityParam = CreateIdentityParam();  
createIdentityParam.url = identityUrl;  
createIdentityParam.keyBookUrl = bookUrl;  
createIdentityParam.keyHash = identitySigner.publicKeyHash();  
await client.createIdentity(lid.url, createIdentityParam, lid);
```
