import 'package:ucan/data/account/model/account.dart';
import 'package:ucan/data/account/model/motif.dart';
import 'package:ucan/data/account/model/paiement.dart';

import '../service/local/account_db_service.dart';
import '../service/remote/account_remote.dart';

class AccountRepository {
  final AccountRemote _accountRemote;
  final AccountDbService _dbService;

  AccountRepository(this._accountRemote, this._dbService);

  Future<Account?> account({required int token}) async {
    final response = await _accountRemote.getAccount(token: token);
    return response.response!.toAccount();
  }

  Future<List<Motif>?> getMotif() async {
    final response = await _accountRemote.getMotif();
    final motif = response.response?.map((e) => e.toMotif()).toList();
    if (motif != null) await _dbService.saveMotifs(motif);
    return motif;
    ;
  }

  Future<Motif> saveMotif({required String name, int? token}) async {
    final response = await _accountRemote.saveMotif(token: token, name: name);
    return response.response!.toMotif();
  }

  Future<Paiement> savePaiement({
    int? token,
    required bool type,
    required String date,
    required int amount,
    required int motif,
    required int account,
  }) async {
    final response = await _accountRemote.createPaiement(
        type: type, date: date, amount: amount, motif: motif, account: account);
    return response.response!.toPaiement();
  }

  Future<List<Paiement>> getPaiement({
    required int token,
  }) async {
    final response = await _accountRemote.getPaiement(token: token);
    return response.response!.map((e) => e.toPaiement()).toList();
  }
}
