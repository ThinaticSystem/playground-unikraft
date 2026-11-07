use axum::{Router, routing::get};
use tokio::net::TcpListener;

async fn hello_world() -> &'static str {
	"Hello, World!"
}

#[tokio::main]
async fn main() -> Result<(), Box<dyn std::error::Error>> {
	let addr = "0.0.0.0:3000";
	let listener = TcpListener::bind(addr).await?;
	println!("Listening on http://{}", addr);

	let app = Router::new().route("/", get(hello_world));
	axum::serve(listener, app).await?;

	Ok(())
}
