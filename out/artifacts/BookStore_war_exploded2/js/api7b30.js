const defaultApiKey = 'demo-2a02822e-ede3-4970-999b-18853d8e0ced'
const defaultClientId = 'demo-a34a5775-ae15-4a05-8422-1023eccbda3f'
loadXMLDoc()

function loadXMLDoc() {
    var xmlhttp = new XMLHttpRequest();

    xmlhttp.onreadystatechange = function () {
        if (xmlhttp.readyState == XMLHttpRequest.DONE) { // XMLHttpRequest.DONE == 4
            if (xmlhttp.status == 200) {
                console.log(JSON.parse(xmlhttp.responseText))
                let data = JSON.parse(xmlhttp.responseText)
                document.getElementById("banks").innerHTML = data.data.map(item => {
                    return `<option value=${item.bin} data-thumbnail=${item.logo}>(${item.bin}) ${item.short_name}</option>`
                }).join('')
            } else if (xmlhttp.status == 400) {
                alert('There was an error 400');
            } else {
                alert('something else other than 200 was returned');
            }
        }
    };

    xmlhttp.open("GET", "https://api.vietqr.io/v2/banks", true);
    xmlhttp.send();
}

// function findAccountName(accountNumber, bankId) {
//     document.getElementById("container-loading").style.display = "flex"
//     var xmlhttp = new XMLHttpRequest();
//     let params = {
//         accountNumber: accountNumber,
//         bin: bankId
//     }
//     xmlhttp.onreadystatechange = function () {
//         if (xmlhttp.readyState == XMLHttpRequest.DONE) { // XMLHttpRequest.DONE == 4
//             if (xmlhttp.status == 200) {
//                 console.log(JSON.parse(xmlhttp.responseText))
//                 let data = JSON.parse(xmlhttp.responseText)
//                 if (data.code == "00") {
//                     document.getElementById("container-loading").style.display = "none";
//                     document.getElementById("error").style.display = "none";
//                     document.getElementById("accountName").value = data.data.accountName;
//                 } else {
//                     document.getElementById("container-loading").style.display = "none";
//                     document.getElementById("error").innerText = `${data.code} - ${data.desc}`;
//                     document.getElementById("error").style.display = "block";
//                     document.getElementById("accountName").value = '';
//                 }
//             } else if (xmlhttp.status == 400) {
//                 alert('There was an error 400');
//             } else {
//                 alert('something else other than 200 was returned');
//             }
//         }
//     };

//     xmlhttp.open("POST", "https://api.vietqr.io/v2/lookup", true);
//     xmlhttp.setRequestHeader("Content-Type", "application/json");

//     let identifyData = getCurrentLocalData()
//     console.log(identifyData);
//     xmlhttp.setRequestHeader("x-api-key", identifyData.apiKey);
//     xmlhttp.setRequestHeader("x-client-id", identifyData.clientId);
//     xmlhttp.send(JSON.stringify(params));
// }


// function init() {
//     checkExistKey()
//     let inputBankId = document.getElementById('banks');

//     let inputAccountNumber = document.getElementById('accountNumber');
//     inputAccountNumber.addEventListener('focusout', async function (e) {
//         let value = e.target.value
//         if (value.length > 0) {
//             console.log(value, inputBankId.value);
//             // await setTimeout(() => {
//             //     document.getElementById("container-loading").style.display = "block"
//             // }, 1500)

//             findAccountName(value, inputBankId.value)
//         }
//     })
//     document.getElementById('btn-api-key').addEventListener('click', () => {
//         let apiKey = prompt('Nhập API-Key')
//         if (apiKey) {
//             saveData(apiKey)
//             checkExistKey()
//         }
//     })
//     document.getElementById('btn-client-id').addEventListener('click', () => {
//         let clientId = prompt('Nhập Client-Id')
//         if (clientId) {
//             saveData(null, clientId)
//             checkExistKey()
//         }
//     })
// }
// function saveData(apiKey = null, clientId = null) {
//     let oldAPIKey = ''
//     let oldClientId = ''
//     let currentData = ''
//     try {
//         currentData = JSON.parse(localStorage.getItem('key-data'))
//         handleData(currentData, oldAPIKey, oldClientId)
//     } catch (error) {
//         handleData(null, oldAPIKey, oldClientId)
//     }
//     function handleData(currentData = null, oldAPIKey, oldClientId) {
//         console.log({ currentData, apiKey, clientId });
//         if (currentData) {
//             oldAPIKey = currentData.apiKey
//             oldClientId = currentData.clientId
//         }
//         localStorage.setItem('key-data', JSON.stringify({
//             apiKey: apiKey || oldAPIKey,
//             clientId: clientId || oldClientId
//         }))
//     }
// }
// function getCurrentLocalData() {
//     let currentData = ''
//     try {
//         currentData = JSON.parse(localStorage.getItem('key-data'))
//         console.log(currentData);
//         return handleData(currentData)
//     } catch (error) {
//         return handleData()
//     }
//     function handleData(data = null) {
//         console.log(data);
//         if (data) {
//             return {
//                 apiKey: data.apiKey || defaultApiKey,
//                 clientId: data.clientId || defaultClientId
//             }
//         }
//         return {
//             apiKey: defaultApiKey,
//             clientId: defaultClientId
//         }
//     }
// }
// function checkExistKey() {
//     let data = getCurrentLocalData()
//     if (data.apiKey == defaultApiKey && data.clientId == defaultClientId) {
//         document.getElementById("exist-key").innerText = ''
//     }
//     else {
//         if (data.apiKey != defaultApiKey && data.clientId == defaultClientId) {
//             document.getElementById("exist-key").innerText = `Truy vấn sử dụng API-key ${cutData(data.apiKey)}`
//         } else if (data.apiKey == defaultApiKey && data.clientId != defaultClientId) {
//             document.getElementById("exist-key").innerText = `Truy vấn sử dụng Client-Id ${cutData(data.clientId)}`
//         } else {
//             document.getElementById("exist-key").innerText = `Truy vấn sử dụng API-key ${cutData(data.apiKey)} và Client-Id ${cutData(data.clientId)}`
//         }
//     }
// }
// function cutData(data) {
//     if (data.length < 5) {
//         return data
//     } else {
//         let lastData = data.slice(data.length - 5, data.length)
//         return `***${lastData}`
//     }

