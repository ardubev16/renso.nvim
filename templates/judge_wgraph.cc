#include <fstream>
#include <iostream>
#include <sys/types.h>
#include <vector>

// weightedGraph.hh
struct WeightedEdge {
    int src, dst, weight;
};

struct DstNode {
    int node, weight;
};

class WeightedGraph {
  protected:
    std::vector<std::vector<DstNode>> adjList;

    size_t edges = 0;
    size_t nodes;

  public:
    explicit WeightedGraph(const size_t n) {
        this->nodes = n;
        this->adjList.resize(n);
    }

    void addEdge(const WeightedEdge edge) {
        this->adjList[edge.src].push_back({edge.dst, edge.weight});
        this->adjList[edge.dst].push_back({edge.src, edge.weight});
        this->edges++;
    }

    const std::vector<DstNode> &getAdjList(const int node) const {
        return this->adjList[node];
    }

    void print() const {
        for (size_t i = 0; i < this->N(); i++) {
            std::cerr << i << " -> ";
            for (DstNode node : this->adjList[i]) {
                std::cerr << node.node << '(' << node.weight << ") ";
            }
            std::cerr << std::endl;
        }
    }

    void dot() const {
        std::ofstream out("graph.dot");
        out << "strict graph {";
        for (size_t i = 0; i < this->N(); i++) {
            for (DstNode node : this->adjList[i]) {
                out << i << "--" << node.node << "[label=\"" << node.weight
                    << "\"] ";
            }
        }
        out << '}';
    }

    const size_t N() const { return this->nodes; }
    const size_t M() const { return this->edges; }
};

class WeightedOrientedGraph : public WeightedGraph {
  private:
    std::vector<std::vector<DstNode>> invAdjList;

  public:
    explicit WeightedOrientedGraph(const size_t n) : WeightedGraph(n) {
        invAdjList.resize(n);
    }

    void addEdge(const WeightedEdge edge) {
        this->adjList[edge.src].push_back({edge.dst, edge.weight});
        this->invAdjList[edge.dst].push_back({edge.src, edge.weight});
        this->edges++;
    }

    const std::vector<DstNode> &getInvAdjList(const int node) const {
        return this->invAdjList[node];
    }

    void dot() const {
        std::ofstream out("graph.dot");
        out << "strict digraph {";
        for (size_t i = 0; i < this->N(); i++) {
            for (DstNode node : this->adjList[i]) {
                out << i << "->" << node.node << "[label=\"" << node.weight
                    << "\"] ";
            }
        }
        out << '}';
    }
};
