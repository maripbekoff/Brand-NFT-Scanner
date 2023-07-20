import 'dart:developer';

import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:walletconnect_flutter_v2/walletconnect_flutter_v2.dart';
import 'package:web3dart/web3dart.dart';

import '../../common/constans/color_constants.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  String launchError = 'Metamask wallet not installed';
  String kShortChainId = 'eip155';
  String kFullChainId = 'eip155:1';

  String? _url;
  SessionData? _sessionData;

  String deepLinkUrl = 'metamask://wc?uri=';

  late Web3App walletConnect;

  @override
  void initState() {
    deepLinkUrl = 'metamask://wc?uri=$_url';
    initWallet();
    super.initState();
  }

  initWallet() async {
    walletConnect = await Web3App.createInstance(
      projectId: '2b0e67dfae16f50e55487eb30fe3de4d',
      metadata: const PairingMetadata(
        name: 'Flutter WalletConnect',
        description: 'Flutter WalletConnect Dapp Example',
        url: 'https://walletconnect.com/',
        icons: [
          'https://walletconnect.com/walletconnect-logo.png',
        ],
        redirect: Redirect(
          native: 'nftbrandscanner://',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: AppColors.scaffoldBackground,
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 70),
              child: Image.asset(
                "assets/images/fox.png",
              ),
            ),
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Text(
                'Мы сервис, который поможет доказать подлинность брендированных вещей.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  color: AppColors.white,
                ),
              ),
            ),
            const Spacer(),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 18),
              decoration: BoxDecoration(
                color: AppColors.grey,
                borderRadius: BorderRadius.circular(28),
              ),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 32),
                    child: Text(
                      'Добро пожаловать!',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        color: AppColors.white,
                        fontSize: 24,
                        height: 1.2,
                      ),
                    ),
                  ),
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 8, 20, 32),
                      child: Text(
                        'Перед тем как начать, тебе нужно авторизоваться через Metamask.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          color: AppColors.lightGrey,
                          fontSize: 16,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(75, 0, 75, 20),
                    child: SizedBox(
                      width: 224,
                      height: 56,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          gradient: const RadialGradient(
                            colors: [
                              Color(0xFFFFD840),
                              Color(0xFFF3ACFF),
                              Color(0xFF8AECFF),
                            ],
                            radius: 6,
                            center: Alignment(1, -3.5),
                          ),
                        ),
                        child: CupertinoButton(
                          onPressed: () async {
                            String? result = await createSession();

                            print(result);

                            const rpcUrl = 'https://bsc-testnet.publicnode.com';

                            final client = Web3Client(rpcUrl, Client());

                            String abiString = await rootBundle
                                .loadString('assets/abis/abi.json');

                            ContractAbi abi =
                                ContractAbi.fromJson(abiString, 'contract');

                            DeployedContract deployedContract = DeployedContract(
                                abi,
                                EthereumAddress.fromHex(
                                    '0x3B823Eef6D5CDbADe6bCb60d91A6C118594AB42f'));

                            Credentials credentials =
                                EthPrivateKey.fromHex('$result');

                            EtherAmount balance =
                                await client.getBalance(credentials.address);

                            BigInt totalBrandCreated = (await client.call(
                              contract: deployedContract,
                              function: deployedContract
                                  .function('totalBrandCreated'),
                              params: [],
                            ))
                                .first;

                            print(totalBrandCreated);
                            print(credentials.address);
                            print(balance.getInEther);

                            // Navigator.pushNamed(context, *****);
                          },
                          borderRadius: BorderRadius.circular(16),
                          child: const Text(
                            'Войти с Metamask',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              color: AppColors.black,
                              fontSize: 14,
                              height: 1.2,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> metamaskIsInstalled() async {
    return await LaunchApp.isAppInstalled(
      iosUrlScheme: 'metamask://',
      androidPackageName: 'io.metamask',
    );
  }

  Future<String?> createSession() async {
    final ConnectResponse connectResponse = await walletConnect.connect(
      requiredNamespaces: {
        kShortChainId: RequiredNamespace(
          chains: [kFullChainId],
          methods: [
            'eth_sign',
            'eth_signTransaction',
            'eth_sendTransaction',
          ],
          events: [
            'chainChanged',
            'accountsChanged',
          ],
        ),
      },
    );

    final Uri? uri = connectResponse.uri;

    if (uri != null) {
      final String encodedUrl = Uri.encodeComponent('$uri');

      _url = encodedUrl;
      deepLinkUrl = 'metamask://wc?uri=$_url';

      log(_url.toString());
      log(deepLinkUrl.toString());

      await launchUrlString(
        deepLinkUrl,
        mode: LaunchMode.externalApplication,
      );

      _sessionData = await connectResponse.session.future;

      log(_sessionData.toString());

      final String account = NamespaceUtils.getAccount(
        _sessionData!.namespaces.values.first.accounts.first,
      );

      return account;
    }

    return null;
  }
}
