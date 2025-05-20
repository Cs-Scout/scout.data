FROM rust:1.74

WORKDIR /app
COPY . .
RUN cargo build --release

CMD ["./target/release/your-api-binary"]