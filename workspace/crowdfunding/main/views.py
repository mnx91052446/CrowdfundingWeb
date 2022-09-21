from django.shortcuts import render
import json
from web3 import Web3, HTTPProvider



def main(request):

    #使用本地端進行測試
    blockchain_address = 'http://127.0.0.1:9545'

    web3 = Web3(HTTPProvider(blockchain_address))
    # 使用第1組帳戶
    web3.eth.defaultAccount = web3.eth.accounts[0]


    #合約json檔案路徑
    compiled_contract_path = 'CrowdfundingDapp/build/contracts/DreamCyut.json'

    #部署完的合約地址
    deployed_contract_address = '0xCaC46b2C3F402ED2F782032835D02371Dc85AF08'
    #解碼若遇到中文，使用utf-8
    with open(compiled_contract_path, encoding="utf-8") as file:
        contract_json = json.load(file)  #讀取json檔
        contract_abi = contract_json['abi']  # 將ABI進行解析


    contract = web3.eth.contract(address=deployed_contract_address, abi=contract_abi)

    #呼叫abi中的函式
    message = contract.functions.testCode().call()


    context = {'test':message}
    return render(request, 'main/main.html', context)
