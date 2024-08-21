mod indexer;
mod parser;
mod server;

#[tokio::main]
async fn main() -> Result<(), anyhow::Error> {
    if let Err(err) = server::run().await {
        eprintln!("{}", err);

        Err(err)
    } else {
        Ok(())
    }
}
