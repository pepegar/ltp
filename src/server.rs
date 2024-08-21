use jsonrpsee::server::{RpcModule, Server};
use std::net::SocketAddr;

pub(crate) async fn run() -> Result<SocketAddr, anyhow::Error> {
    let server = Server::builder().build("127.0.0.1:0").await?;
    let mut module = RpcModule::new(());
    module.register_method("say_hello", |_, _, _| "lo")?;
    let addr = server.local_addr()?;
    println!("{:?}", addr);
    let handle = server.start(module);

    let _ = tokio::spawn(handle.stopped()).await;

    Ok(addr)
}
