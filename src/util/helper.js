const connectToDatabase = () => {
    const dummy = new Promise((resolve, reject) => {
        setTimeout(() => {
            resolve();
        }, 1000)
    })
};

export default connectToDatabase;