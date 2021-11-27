const params =  {
    
};
try {
    const response = await Moralis.Cloud.run('endpoint', params);
    
} catch (error) {
    const code = error.code;
    const message = error.message;
}