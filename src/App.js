import { useEffect } from "react";
import "./App.css";

function App() {

  useEffect(() => {
    const loadProvider = async () => {
      console.log(window.web3)
    }
    loadProvider()
  }, [])

  return (
    <>
      <div className="faucet-wrapper">
        <div className="faucet">
          <div className="balance-view is-size-2">
            Current Balance <strong>10</strong> ETH
          </div>
          <button onClick={async () => {
            const accounts = await window.ethereum.request({ method: "eth_requestAccounts" })
            console.log(accounts)
          }} className="btn mr-2">Enable Ethereum</button>
          <button className="btn mr-2">Donate</button>
          <button className="btn">Withdraw</button>
        </div>
      </div>
    </>
  );
}

export default App;
