# 💸 FinanceApp

Aplicativo de transações financeiras desenvolvido como parte de um desafio técnico para a vaga de desenvolvedor iOS sênior. O app permite ao usuário visualizar saldo, extrato e realizar transferências. SwiftUI, arquitetura MVVM, API mock e testes unitários.

---

## 📱 Funcionalidades

- Visualização do saldo da conta
- Listagem das últimas transações na tela inicial
- Tela de histórico completo de transações
- Realização de transferências entre contas
- Autenticação fictícia via nome (opcional)
- Feedback visual para erros e sucessos

---

## 🧱 Arquitetura

O app foi construído utilizando os princípios do MVVM com SwiftUI:

- `Models/`: Estruturas como `Transaction` e `Account`
- `ViewModels/`: Camadas intermediárias com lógica de estado e negócios
- `Views/`: Telas SwiftUI conectadas aos ViewModels
- `Services/`: Simulação de uma API (`MockAPIService`)
- `Helpers/`: Utilitários como formatação de moeda (`CurrencyFormatter`)

### 🔁 Gerenciamento de Estado

- `@StateObject`, `@ObservedObject` e `@Binding` são usados para propagação reativa de dados entre views.
- O fluxo de atualização é disparado apenas quando necessário, evitando carregamentos em loop.

---

## 🧪 Testes

Testes unitários foram escritos para cobrir os principais ViewModels:

- `DashboardViewModelTests`
- `TransferViewModelTests`
- `TransactionsViewModelTests`

Para rodar os testes:
```bash
⌘ + U no Xcode
```

---

## 🧰 Tecnologias Utilizadas

- Swift 5
- SwiftUI
- MVVM
- XCTest
- Combine (conceitualmente, para comunicação assíncrona)
- Xcode 15+

---

## 🚀 Como rodar o projeto

1. Clone o repositório:

```bash
git clone https://github.com/seu-usuario/FinanceApp.git
```

2. Abra o projeto:

```bash
open FinanceApp.xcodeproj
```

3. Execute no simulador:

```bash
⌘ + R
```

4. Para rodar os testes:

```bash
⌘ + U
```

---

## 📸 Preview

| Dashboard                  | Transferência               | Histórico                    | Login (Opcional)            |
|---------------------------|-----------------------------|------------------------------|-----------------------------|
| ![](docs/dashboard.png)   | ![](docs/transfer.png)      | ![](docs/history.png)        | ![](docs/login.png)         |

---

## 👨‍💻 Autor

Desenvolvido por Edwy Lugo como parte do desafio técnico mobile iOS.
