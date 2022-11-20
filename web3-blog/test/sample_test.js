const {expect} = require("chai");
const {ethers} = require("hardhat");

describe("Blog", function () {
  it("create a post", async function () {
    const Blog = await ethers.getContractFactory("Blog");
    const blog = await Blog.deploy("me blog");
    await blog.deployed();
    await blog.createPost("Posting the poster", "1222");
    
    const posts = await blog.fetchPosts();
    expect(posts[0].title).to.equal("Posting the poster");
  })
});